package com.exe;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class ExecuteTest {
    /**
     * Executors.newSingleThreadExecutor() 创建一个单线程化(容量为1)的线程池，它只会用唯一的工作线程来执行任务，
     * 保证所有任务按照指定顺序(FIFO, LIFO, 优先级)执行。
     */
    public static void main(String[] args) {
        ExecutorService singleThreadExecutor = Executors.newSingleThreadExecutor();
        for (int i = 0; i < 10; i++) {
            final int index = i;
            singleThreadExecutor.execute(new Runnable() {
                public void run() {
                    try {
                        System.out.println("ThreadName:" + Thread.currentThread().getName()+",第"+index+"个线程");
                        Thread.sleep(1000);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            });
        }
    }
}