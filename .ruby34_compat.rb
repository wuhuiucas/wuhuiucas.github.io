# 仅本地预览使用：Ruby 3.2+ 移除了 Object#tainted? / #untaint，
# 但 github-pages 锁定的 Liquid 4.0.3 仍在调用它们。
# 通过 RUBYOPT="-r./.ruby34_compat.rb" 在 Ruby 启动时加载本文件，
# 使 Liquid 加载之前 Object 上重新具备这两个方法。
# GitHub Pages 线上构建使用更老的 Ruby，不受影响，可放心 push。
class Object
  def tainted?
    false
  end

  def untaint
    self
  end
end unless Object.new.respond_to?(:tainted?)
