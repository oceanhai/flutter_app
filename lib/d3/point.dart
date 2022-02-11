//包括类的定义 如果使用 _开头 意味着这个类是private
class  Point{
  //使用 _ 开始命名的变量 就是Java的 private
  int _x;
  int y;

  //构造方法语法糖（语法糖指计算机语言中添加的某种语法）
  //构造方法 相较于java简化了
  Point(this._x, this.y); //TODO 好像跟kotlin一样
  //java的构造方法   写法
  // Point(int _x, int y){
  //   this._x = _x;
  //   this.y = y;
  // }

  //TODO dart 不允许方法重载
  ///可选命名参数 {}
  // Point({this.y});//可选命名参数
  // Point({int _x, int y});//命名参数不能以下划线开偷
  //  Point({int x,int y}){
  //
  //  }

  ///非要使用重载呢？   类名.X() 命名构造方法
  // 命名构造方法  命名更加直观的表示这个构造方法的作用与特性
  Point.Cool(int y){
    this. y = y;
    print("我好帅啊!");
  }
  Point.X(this._x);

  //参数初始化列表 好处:初始化你类当中的属性 可以不写方法体
  Point.XY():_x=1,y=2;
  Point.fromMap(Map map):_x=map['x'],y=map['y'];

}

///重定向构造方法
class View{

  ///视频讲师的写法 讲师说不支持java写法(lll￢ω￢)
  // View(int context,int attr);
  // //重定向构造方法
  // View.a(int context):this(context,0);

  ///TODO 我感觉这样写重定向，android开发员看着更熟悉  java写法
  View(int context):this.a(context, null);
  View.a(int context, int attrs):this.b(context,attrs,null);
  View.b(int context, int attrs, int defStyleAttr);

  //Java写法
//  View(int context){
//    this(context,0);
//  }
}

///常量构造函数
class ImmutabelPoint{
  //不能为具有非final字段的类定义const构造函数
  // int x;
  // int y;
  final int x;
  final int y;
  // 常量构造方法==》
  const ImmutabelPoint(this.x,this.y);
}


///工厂构造函数
// class Manager{
//   factory Manager(){
//     return new Manager();//TODO 这样写有毛病吗？ 栈溢出
//   }
// }

///工厂构造函数  单例
class Manager{
  int i = 1;
  static Manager _instance;//TODO 私有化
  // 工厂构造方法 必须返回一个 实例对象
  factory Manager.getInstance(){
    if(_instance == null){//TODO dart是单线程 不需要加锁
      _instance = new Manager._newInstance();
    }
    return _instance;
  }

//  static Manager get2(){
//    return new Manager();
//  }

  //TODO 私有的 private的
  Manager._newInstance();

}




void main(){

  // new Manager();//栈溢出

  /**
   * 工厂构造方法
   */
  new Manager.getInstance();
  // new Manager();//TODO 报错吗？
  // new Manager._newInstance();//TODO 报错吗？

}





