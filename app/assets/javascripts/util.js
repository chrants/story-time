this.getSerialized = function(form) {
  var arr, obj, serialized, _fn, _i, _len;
  arr = form.serializeArray();
  serialized = {};
  _fn = function() {
    return serialized[obj.name] = obj.value;
  };
  for (_i = 0, _len = arr.length; _i < _len; _i++) {
    obj = arr[_i];
    _fn();
  }
  console.log(serialized);
  return serialized;
};

this.redirect_to = function(string) {
  return window.location.assign(string);
};

this.redirect_no_history = function(string) {
  return window.location.replace(string);
};

this.postForm = function(form, callback) {
  if (callback == null) {
    callback = this.blank_function;
  }
  return $.post(form.attr('action'), getSerialized(form), callback);
};

String.prototype.replaceAll = function(regex, replacement) {
  var retstr, temp;
  retstr = this;
  while (temp !== retstr) {
    temp = retstr;
    retstr = retstr.replace(regex, replacement);
  }
  return retstr;
};