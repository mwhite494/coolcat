FFMPEG commands for modifying video

# Reverse video and encode for web player
ffmpeg -i catvideo.mp4 -vf reverse -af areverse -vcodec h264 -acodec aac -strict -2 catvideo_reversed.mp4

# Encode for web player only
ffmpeg -i catvideo.mp4 -vcodec h264 -acodec aac -strict -2 catvideo_compatible.mp4

# Extract first frame
ffmpeg -i catvideo.mp4 -vf "select=eq(n\,0)" -q:v 3 catvideo_first_frame.jpg

# Extract last frame
ffmpeg -sseof -3 -i catvideo.mp4 -update 1 -q:v 1 catvideo_last_frame.jpg
