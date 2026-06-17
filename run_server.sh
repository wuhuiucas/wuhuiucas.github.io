# Ruby 3.2+ 移除了 Object#tainted? / #untaint，但 github-pages 锁的 Liquid 4.0.3 仍在调用它们。
# 通过 RUBYOPT 预加载兼容补丁，让本地能用新 Ruby 跑起来；线上 GitHub Pages 不受影响。
RUBYOPT="-r$(pwd)/.ruby34_compat.rb" bundle exec jekyll liveserve