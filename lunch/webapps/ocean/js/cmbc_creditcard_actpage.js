$(function() {
    var obj = new pageObj();
    obj.init();
});

function pageObj() {
    this.userId = $('#userId').val() || '0'; //用户id
    this.hasLogin = this.userId !== '0'; //是否登录
    this.actUrl = $('#actUrl').val(); //项目地址
    this.loginUrl = $('#loginUrl').val(); //登录链接
}

// 页面初始化
pageObj.prototype.init = function() {
    var self = this;
    // 绑定页面事件
    self.bindEvent();
};
// 绑定页面事件
pageObj.prototype.bindEvent = function() {
    var self = this;
    // 申请办卡
    $("#applyBtn,#fixedIcon").on('click', function() {
        //window.location.href = "http://192.168.30.72/creditCard_wap/card.html";
        if (self.hasLogin) {
             window.location.href = self.actUrl;
        } else {
             self.loginByWap(self.loginUrl);
        }
    });
};
// 移动端登录
pageObj.prototype.loginByWap = function(loginUrl) {
    var self = this;
    window.location.href = loginUrl;
};