function ClickHandler(button, callback) {
    this.button = button;
    this.button.onClickHandler = this;
    this.handleEvent = callback;
    
    callback();
}
