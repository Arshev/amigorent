CKEDITOR.editorConfig = function (config) {
  config.autoParagraph = false;
  config.protectedSource.push(/<(style)[^>]*>.*<\/style>/ig);
}
