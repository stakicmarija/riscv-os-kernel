#ifndef LIST_HPP
#define LIST_HPP

template <typename T>

class List{
private:
    struct Elem{
      T* data;
      Elem* next;
      Elem(T* data, Elem* next) : data(data), next(next) {}
    };
    Elem *head, *tail;
public:
    List() : head(0), tail(0) {}
    List(const List<T> &) = delete;
    List<T> &operator=(const List<T> &) = delete;

    void addFirst(T *data){
      Elem* newElem = new Elem(data, head);
      head = newElem;
      if(!tail) tail = head;
    }

    void addLast(T *data){
      Elem* newElem = new Elem(data, 0);
      if(tail){
        tail->next = newElem;
        tail = newElem;
      }else head = tail = newElem;
    }

    T* removeFirst(){
      if(!head) return 0;
      Elem *elem = head;
      head = head->next;
      if(!head) tail = 0;

      T* data = elem->data;
      delete elem;
      return data;
    }

    T* removeLast(){
      if(!head) return 0;
      Elem *prev = 0;
      for(Elem* cur = head; cur && cur != tail; cur = cur->next){
        prev = cur;
      }
      Elem *elem = tail;
      if(prev) prev->next = 0;
      else head = 0;
      tail = prev;

      T *returnData = elem->data;
      delete elem;
      return returnData;
    }

    T* peekFirst(){
      if(!head) return 0;
      return head->data;
    }

    T *peekLast(){
      if(!tail) return 0;
      return tail->data;
    }

    int getSize(){
        int size = 0;
        for(Elem* curr = head; curr != nullptr; curr = curr->next) size++;
        return size;
    }
};

#endif