$.fn.extend({
    serializeForm2JSON: function () {
        if (this.length > 1) {
            alert("你只能用ID选择器，选择唯一一个表单元素")
            return
        }
        var inputs = $(this[0]).serializeArray();
        var map = {};
        inputs.forEach(function (item, index) {
            if (map[item.name]) {  //返回json中有该属性
                if (!map[item.name].push) { //将已存在的属性值改成数组
                    map[item.name] = [map[item.name]];
                }
                map[item.name].push(item.value || ''); //将值存放到数组中
            } else {  //返回json中没有有该属性
                map[item.name] = item.value || '';  //直接将属性和值放入返回json中
            }
        });
        return JSON.stringify(map);
    },

    imgShow: function (options) {
        $(this).change(function () {
            for (var i = 0; i < event.target.files.length; i++) {
                var file = event.target.files.item(i);
                if (!(/^image\/.*$/i.test(file.type))) {
                    continue; //不是图片 就跳出这一次循环
                }
                //实例化FileReader API
                var freader = new FileReader();
                freader.readAsDataURL(file);
                freader.onload = function (e) {
                    console.log(e.target.result);
                    $("#" + options.imageId).attr("src", e.target.result);
                }
            }
        })
    }
})