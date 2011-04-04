require 'rexml/xpath'

module UserHelper
  def display_name
    @profile_data['person']['name']['givenName']
  end

  def profile_age
    @profile_data['person']['age']
  end

  def profile_city
    @profile_data['person']['currentLocation']['locality']
  end

  def profile_pic
    @profile_data['person']['thumbnailUrl'].sub(/\/[sl]_/i, '/m_')
  end

  def profile_last_update
    ''
  end

  def profile_headline
    ''
  end

  def profile_about_me
    @profile_data['person']['aboutMe']
  end

  def profile_to_meet
    'i like to mmeet '
  end

  def profile_name
    (@profile_data['person']['displayName'])
  end

  def profile_interests
    (@profile_ext_data['person']['interests'])
  end

  def profile_music
    (@profile_ext_data['person']['music'])
  end

  def profile_movies
    (@profile_ext_data['person']['movies'])
  end

  def profile_television
    (@profile_ext_data['person']['television'])
  end

  def profile_books
    (@profile_ext_data['person']['books'])
  end

  def profile_heroes
    (@profile_ext_data['person']['heroes'])
  end

  def profile_more_pics
    "http://viewmorepics.myspace.com/index.cfm?fuseaction=user.viewAlbums&friendID=#{@userid}"
  end

  def profile_more_vids
    "http://vids.myspace.com/index.cfm?fuseaction=vids.channel&channelID=#{@userid}"
  end

  def profile_more_play
    "http://music.myspace.com/index.cfm?fuseaction=music.singleplaylist&friendid=#{@userid}&plid="
  end

  def remove_html(str)
    return "" unless str
    str.sub(/<.*?>|<.*?\/>|<\/.*?>/, ' ')
  end

  def each_song(doc, &block)
    REXML::XPath.each(doc, '//entry/category[@label="SongUpload" or @label="ProfileSongAdd"]/..', &block)
  end

  def compute_realm
    uri = URI::parse(url_for(:action=>:index, :only_path => false))
    uri.path = '/'
    uri.to_s
  end
end
