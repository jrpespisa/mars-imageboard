var timeStamp = $(".timestamp").text();
var newDate = [];

var standardizeTime = function() {
  var toArr = function() {
    return timeArr = timeStamp.split("  ");
  };

  toArr();
  for (var i = 0; i < timeArr.length; i++) {
    date = new Date(timeArr[i])
    newDate.push(date);
  };
  return newDate;
};

var newTime = standardizeTime();

var appendTimeStamps = function() {
  for (var i = 0; i < newTime.length; i++) {
    debugger;
    newTime[i].toString();
    $("#timestamp[" + i + "]").append(newTime[i]);
  };
};

appendTimeStamps();
