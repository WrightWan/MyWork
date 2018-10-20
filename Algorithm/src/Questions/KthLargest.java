package Questions;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.PriorityQueue;

public class KthLargest {
    int top;
    PriorityQueue<Integer> queue;
    /*
    * @param k: An integer
    */public KthLargest(int k) {
        // do intialization if necessary
        this.top = k;
        this.queue = new PriorityQueue<>(top, Collections.reverseOrder());
        
    }

    /*
     * @param num: Number to be added
     * @return: nothing
     */
    public void add(int num) {
        // write your code here
        this.queue.add(num);
    }

    /*
     * @return: Top k element
     */
    public List<Integer> topk() {
        List<Integer> res = new ArrayList<>();
        for(int i = 0; i < this.top; i++) {
            if(!this.queue.isEmpty()) {
                res.add(this.queue.poll());
            }
        }
        for(int num : res) {
            this.queue.add(num);
        }
        return res;
    }
    
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		KthLargest s = new KthLargest(3);
		s.add(3);
		s.add(10);
		s.add(13);
		System.out.println(s.topk());	

	}

}
