class Queue
    def initialize
        @queue = []
    end
    def enqueue(el)
        @queue.shift(el)
    end
    def dequeue
        @queue.pop
    end
    def peek
        @queue.stack[0]
    end
end