


typedef void EventCallback(dynamic arg);
/// 事件总线
class EventBus{
  // 私有构造方法
  EventBus._();

  // 单例
  static EventBus _instance = EventBus._();
  // 工厂构造方法
  factory EventBus.getInstance() => _instance;

  // 内部存储事件
  var _events = Map<Object, List<EventCallback>>();

  /// 订阅
  void register(eventName, EventCallback k){
    if(null == eventName || null == k){
      return;
    }

    _events[eventName] ??= new List<EventCallback>();
    _events[eventName].add(k);
  }

  /// 解除订阅
  void unregister(eventName, [EventCallback k]){
    if(null == eventName){
      return;
    }
    if(null != k){
      _events[eventName]?.remove(k);
    }else{
      _events.remove(eventName);
    }
  }

  /// 发送事件
  void post(eventName, [arg]){
    if(!_events.containsKey(eventName)){
      return;
    }
    _events[eventName].forEach((element) {element.call(arg);});
  }
}

class Events{
  static const webEvent = "webEvent";
}