class DestroyPlaylistRecordsJob
  include Sidekiq::Job

  def perform(music_ids, user_email)
    user = User.find_by(email: user_email)
    music_ids.each do |music_id|
      music = Music.find music_id
      user.user_musics.playlist.where(music: music).order(created_at: :desc).destroy_all
    end
  end
end
