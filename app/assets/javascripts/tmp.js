function Ninja (name, age) {
  var self = this;

  this.name = name;
  this.age  = age;

  function phrase() {
    var msg = 'My name is ' + self.name +
              'and I am ' + self.age + 'yrs old';
    return msg;
  }

  this.greet = function() {
    console.log(phrase());
  };

}

var ninja1 = new Ninja('Yukihiro Matsumoto', 43);
ninja1.greet();
