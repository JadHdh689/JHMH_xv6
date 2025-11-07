#include "types.h"
#include "stat.h"
#include "user.h"
#include "ulock.h"
#include "uthread.h"

// ===== Shared state =====
static lock_t lk;
static volatile int counter = 0;

// a small shared array to also prove address-space sharing
#define ARRN 16
static volatile int shared_arr[ARRN];

// cheap, noisy work
static void busy(int spins){
  for(volatile int i = 0; i < spins; i++) ;
}

// worker: increments `counter` `loops` times under the lock,
// and nudges the scheduler via sleep(0) occasionally.
static void worker(void *a1, void *a2) {
  int tid   = (int)(uint)a1;   // thread id (0..n-1)
  int loops = (int)(uint)a2;   // how many increments

  printf(1, "[T%d] start (loops=%d)\n", tid, loops);

  // mark we started in shared array (no lock, just a flag)
  if (tid < ARRN) shared_arr[tid] = 1;

  for(int i = 0; i < loops; i++){
    lock_acquire(&lk);

    int before = counter;
    // simulate a tiny critical section cost
    busy(2000);
    counter = before + 1;

    // also show we can safely touch a small shared array under the lock
    if (tid < ARRN) shared_arr[tid]++;

    lock_release(&lk);

    // give the scheduler chances to shuffle us
    if ((i & 31) == 0) sleep(0); // yield-ish
  }

  printf(1, "[T%d] done\n", tid);
  exit();  // end THIS thread, not the whole process
}

int
main(int argc, char *argv[]) {
  // Defaults: 4 threads, 1000 increments each
  int n     = 4;
  int loops = 1000;

  if (argc >= 2) n     = atoi(argv[1]);
  if (argc >= 3) loops = atoi(argv[2]);
  if (n < 1) n = 1;
  if (loops < 1) loops = 1;

  printf(1, "t_thread_showcase: nthreads=%d, loops=%d (expect counter=%d)\n",
         n, loops, n*loops);

  // init shared state
  lock_init(&lk);
  for (int i = 0; i < ARRN; i++) shared_arr[i] = 0;

  // spawn
  int ok = 1;
  for (int i = 0; i < n; i++){
    int pid = thread_create(worker, (void*)(uint)i, (void*)(uint)loops);
    if (pid < 0){
      printf(1, "t_thread_showcase: thread_create failed at i=%d\n", i);
      ok = 0;
      break;
    }
  }

  if (!ok){
    // if any create failed, just bail (keeps output clear)
    printf(1, "t_thread_showcase: aborting due to create error\n");
    exit();
  }

  // join everyone
  for (int j = 0; j < n; j++){
    int r = thread_join();
    if (r < 0){
      printf(1, "t_thread_showcase: join failed at j=%d\n", j);
    }
  }

  // verify shared array marks for first min(n, ARRN) threads
  int seen = 0, bumps = 0;
  for (int k = 0; k < ARRN && k < n; k++){
    if (shared_arr[k] > 0) seen++;
    if (shared_arr[k] > 1) bumps++;
  }

  printf(1, "t_thread_showcase: FINAL counter=%d (expect %d)\n", counter, n*loops);
  printf(1, "t_thread_showcase: shared_arr seen=%d/%d, bumped=%d\n",
         seen, (n < ARRN ? n : ARRN), bumps);

  if (counter == n*loops)
    printf(1, "[OK] counter matches expectation.\n");
  else
    printf(1, "[FAIL] counter mismatch!\n");

  exit();
}
