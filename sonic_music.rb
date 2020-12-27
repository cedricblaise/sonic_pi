# Welcome to Sonic Pi v3.1
use_bpm 65

loops = 0

in_thread do
  loop do
    4.times do
      sample :drum_cymbal_closed, amp: 0.2
      sleep 0.5
    end
    loops += 1
  end
end

in_thread do
  loop do
    sleep 1
    sample :drum_snare_hard, amp: 0.2, finish: 0.5
    sleep 1
  end
end

in_thread do
  loop do
    sample :bd_808
    sleep 0.75
    sample :bd_808
    sleep 0.25
    sample :bd_808
    sleep 0.5
    sample :bd_808
    sleep 0.25
    sample :bd_808
    sleep 0.5
    sample :bd_808
    sleep 0.25
    sample :bd_808
    sleep 0.5
    sample :bd_808
    sleep 1
  end
end

in_thread do
  loop do
    use_synth :bnoise   # wave noise
    sleep 16
    if loops > 4    # delayed entry
      play 100, amp: 0.1, attack: 2, release: 2
    end
  end
end

in_thread do
  loop do
    play chord(:c3, :major7), amp: 0.5, attack: 3, release: 5
    sleep 8
    play chord(:e3, :major7), amp: 0.5, attack: 3, release: 5
    sleep 8
    play chord(:g3, :major7), amp: 0.5, attack: 3, release: 5
    sleep 8
    play chord(:d3, :major7), amp: 0.5, attack: 3, release: 5
    sleep 8
  end
end
