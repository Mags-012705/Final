public class SegmentList {
  Segment start, end;
  int size;

  SegmentList() {
    size = 0;
    start = new Segment(0, 0, 0, 0, 0, 1);
    end = new Segment(0, 0, 0, 0, 0, 1);
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

  void testing() {
    Segment current = start;
    int x = 0, y = 0;
    while (current != null) {
      if (y >= height) {
        y = 0;
        x += 250;
      } else {
        y += 10;
      }
      current.testing(x, y);

      current = current.next;
    }
  }
  
  void delete(Segment toDel) {
    if (toDel != null) {
      toDel.next.prev = toDel.prev;
      toDel.prev.next = toDel.next;
    }
  }
  
  Segment getSegment(int x, int y) {
    Segment current = this.start;
    while (current != null) {
      if (current.endX > current.startX) {
        if ((abs(current.A*x + current.B*(y+5) + current.C))/sqrt(current.A*current.A + current.B*current.B) < 10
        && (x <= current.endX && x >= current.startX)) {
          return current;
        }
      } else if (current.endX < current.startX) {
        if ((abs(current.A*x + current.B*(y+5) + current.C))/sqrt(current.A*current.A + current.B*current.B) < 10
        && (x >= current.endX && x <= current.startX)) {
          return current;
        }
      } else if (current.startX == current.endX) {
        if (x >= current.endX - 1 && x <= current.startX + 1 && y >= current.endY - 1 && y <= current.startY + 1) {
          return current;
        }
      }
      current = current.next;
    }
    return null;
  }
}
