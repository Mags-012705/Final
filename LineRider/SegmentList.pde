public class SegmentList {
  Segment start, end;
  int size;
  
  SegmentList() {
    size = 0;
    start = new Segment(0,0,0,0,0,1);
    end = new Segment(0,0,0,0,0,1);
    start.next = end;
    end.prev = start;
  }
  
  void add(Segment x) {
    x.prev = end.prev;
    x.next = end;
    end.prev.next = x;
    end.prev = x;
  }
  
  void display() {
    Segment current = start;
    while (current != null) {
      current.display();
      current = current.next;
    }
  }
  
}
