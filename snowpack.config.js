// Snowpack Configuration File
// See all supported options: https://www.snowpack.dev/reference/configuration

module.exports = {
  exclude: [
    '**/*.rb',
    '**/node_modules/**/*',
    '/app/Gemfile',
    '/app/bin/*',
    '/app/Gemfile.lock',
    '/app/dump.rdb',
    '/app/glitch.json',
    '/app/LICENSE.txt',
    '/app/README.md',
    '/app/package.json',
    '/app/package-lock.json',
    '/app/snowpack.config.js',
  ],
  buildOptions: {
    out: 'public'
  }
};
