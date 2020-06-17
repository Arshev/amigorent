CKEDITOR.editorConfig = function (config) {
  config.autoParagraph = false;
  config.protectedSource.push(/<(style)[^>]*>.*<\/style>/ig);
  config.allowedContent = true; /* all tags */
}
