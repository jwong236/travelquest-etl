import time


def monitor_queues(queues, interval=5):
    """Monitor the size of the queues in the pipeline."""
    try:
        while True:
            print("\n📌 Queue Status:")
            for name, queue in queues.items():
                print(f"🔹 {name}: {queue.qsize()} items")
            print("-" * 40)
            time.sleep(interval)
    except KeyboardInterrupt:
        print("\n🛑 Queue monitoring stopped.")
