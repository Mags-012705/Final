public class colorBlocks {
  colorBlock start, end;
  
  colorBlocks() {
    start = new colorBlock(0,0,255);
    end = new colorBlock(0,0,255);
    start.next = end;
    end.prev = start;
  }
  
  void add (colorBlock toAdd) {
    toAdd.prev = end.prev;
    toAdd.next = end;
    end.prev.next = toAdd;
    end.prev = toAdd;
  }
  
    void display() {
    colorBlock current = start;
    while (current != null) {
      current.display();
      current = current.next;
    }
  }
}
