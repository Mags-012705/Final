public class SegmentList {
  Segment start, end;
  int size;
  
  SegmentList() {
    size = 0;
    start = new Segment(0,0,0,0,0,1);
    end = new Segment(0,0,0,0,0,1);
  }
  
  void add(Segment x) {
    x.prev = end.prev;
    x.next = end;
    end.prev.next = x;
    end.prev = x;
  }
  
  void display() {
    
  }
}
