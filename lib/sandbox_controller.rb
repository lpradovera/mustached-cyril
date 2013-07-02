# encoding: utf-8

class SandboxController < Adhearsion::CallController
  def run
    answer
    2.times do
      play "tt-weasels"
    end
  end
end
