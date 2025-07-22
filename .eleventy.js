module.exports = function(eleventyConfig) {
  // Passthrough copy for static assets (if any)
  eleventyConfig.addPassthroughCopy({ "src/static": "static" });

  return {
    dir: {
      input: "src",
      includes: "_includes",
      data: "_data",
      output: "_site"
    },
    markdownTemplateEngine: "njk",
    htmlTemplateEngine: "njk",
    dataTemplateEngine: "njk"
  };
}; 