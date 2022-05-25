public class SegmentList {
  Segment start, end;
  int size;
  
  SegmentList() {
    size = 0;
  }
  
  void add(Segment x) {
    if (size == 0) {
      start = x;
      end = x;
    } else {
      end = x;
    }
  }
  
  //void display() {
    
  //   {
  //    line(s.getStartX(),s.getStartY(),s.getEndX(),s.getEndY());
  //  }
  //}
}
