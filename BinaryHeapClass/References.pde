/*

public class minHeap {
  public int size;
  public int[] mH;
  public int position;

  public minHeap(int size) {
    this.size = size;
    mH = new int[size + 1]; // size+1 because index 0 will be empty
    position = 0;
  }

  public void createHeap(int[] arrA) {
    if (arrA.length > 0) {
      for (int i = 0; i < arrA.length; i++) {
        insert(arrA[i]);
      }
    }
  }

  public void display() {
    for (int i = 1; i < mH.length; i++) {
      System.out.print(" " + mH[i]);
    }
    System.out.println("");
  }

  public void insert(int x) {
    if (position == 0) { // check if Heap is empty
      mH[position + 1] = x; // insert the first element in heap
      position = 2;
    } else {
      mH[position++] = x; // insert the element to the end
      bubbleUp(); // call the bubble up operation
    }
  }

  public void bubbleUp() {
    int pos = position - 1; // last position
    while (pos > 0 && mH[pos / 2] > mH[pos]) { // check if its parent is
                          // greater.
      int y = mH[pos]; // if yes, then swap
      mH[pos] = mH[pos / 2];
      mH[pos / 2] = y;
      pos = pos / 2; // make pos to its parent for next iteration.
    }
  }

  public int extractMin() {
    int min = mH[1]; // extract the root
    mH[1] = mH[position - 1]; // replace the root with the last element in
                  // the heap
    mH[position - 1] = 0; // set the last element as 0
    position--; // reduce the position pointer
    sinkDown(1); // sink down the root to its correct position
    return min;
  }

  public void sinkDown(int k) {
    int a = mH[k];
    int smallest = k;
    // check which is smaller child , 2k or 2k+1.
    if (2 * k < position && mH[smallest] > mH[2 * k]) {
      smallest = 2 * k;
    }
    if (2 * k + 1 < position && mH[smallest] > mH[2 * k + 1]) {
      smallest = 2 * k + 1;
    }
    if (smallest != k) { // if any if the child is small, swap
      swap(k, smallest);
      sinkDown(smallest); // call recursively
    }

  }

  public void swap(int a, int b) {
    // System.out.println("swappinh" + mH[a] + " and " + mH[b]);
    int temp = mH[a];
    mH[a] = mH[b];
    mH[b] = temp;
  }

  // function to delete any entry in heap
  public void delete(int x) {
    // find it and replace it with the last entry in Heap
    int index = 0;
    for (int i = 1; i < mH.length; i++) {
      if (mH[i] == x) {
        index = i;
        break;
      }
    }
    mH[index] = mH[position - 1];
    mH[position - 1] = 0; // set the last element as 0
    position--;
    sinkDown(index);
  }

  public static void main(String args[]) {
    int arrA[] = { 3, 2, 1, 7, 8, 4, 10, 16, 12 };
    System.out.print("Original Array : ");
    for (int i = 0; i < arrA.length; i++) {
      System.out.print("  " + arrA[i]);
    }
    minHeap m = new minHeap(arrA.length);
    System.out.print("\nMin-Heap : ");
    m.createHeap(arrA);
    m.display();
    m.delete(7);
    m.display();

  }

}

______________________________________________________

Hypothesis: -e[1] should be the first value of BinaryHeap while e[0] is -infinity;
bestNodes = new BinaryHeap( function (e) { return -e[1]; } );

metric(a, b){
  
dx = a.x - b.x;
dy = a.y - b.y;

return pow(dx, 2) + pow(dy, 2);
  
}

a: 444.8548, 47.1749
b: 367.7584, 128.3530

dx: 444.8548 - 367.7584 = 77.0964; // ^2 5943.8549
dy: -81.1781;                      // ^2 6589.8839

dist(a, b) = 12533.7388

console.log(-e[1]) returns series for 444.8548, 47.1749:
-4959.612003530001
-1763.8684562499993
-4959.612003530001
-7809.584491249998
-1763.8684562499993
-4959.612003530001
0

console.log(-e[1]) returns series for 212.2, 333.95:


*/
