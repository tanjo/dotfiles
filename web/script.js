class MarkdownHtml {
  static get MARKDOWN_CONTENT_404() {
      return "# 404 Not Found\n\nページが見つかりません.";
  }

  static get DEFAULT_PAGE() {
    return "README";
  }

  static get BASE_URL() {
    return "https://tanjo.github.io/dotfiles";
  }

  static get MARKDOWN_FILENAME_EXTENSION() {
    return ".md";
  }

  static get CONTAINER() {
    return "content";
  }

  getUrlQuery() {
    var url = window.location.search;
    var hash = url.slice(1).split('&');
    var query = hash
        .map((h) => h.split('='))
        .reduce((queries, h) => {
          queries[h[0]] = h[1];
          return queries;
        }, []);
    if (query) {
      return query;
    }
    return [];
  }

  getQ() {
    return this.getUrlQuery().q || MarkdownHtml.DEFAULT_PAGE;
  }

  getMarkdown() {
    return this.requestGet(MarkdownHtml.BASE_URL + "/" + this.getQ().toUpperCase() + MarkdownHtml.MARKDOWN_FILENAME_EXTENSION);
  }

  requestGet(url) {
    return new Promise((resolve, reject) => {
      var request = new XMLHttpRequest();
      request.open('get', url);
      request.onload = () => {
        if (request.readyState === 4 && request.status === 200) {
          resolve(request.responseText);
        } else {
          reject(new Error(request.statusText));
        }
      };
      request.onerror = () => {
        reject(new Error(request.statusText));
      }
      request.send(null);
    });
  }

  show() {
    return new Promise((resolve, reject) => {
      this.getMarkdown()
        .then((responseText) => {
          resolve(responseText);
        })
        .catch((error) => {
          resolve(MarkdownHtml.MARKDOWN_CONTENT_404);
        });
    });
  }
};

window.onload = () => {
  new MarkdownHtml()
    .show()
    .then((markdown) => document.getElementById(MarkdownHtml.CONTAINER).innerHTML = marked(markdown));
}
