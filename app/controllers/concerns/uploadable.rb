module Uploadable
  extend ActiveSupport::Concern

  private
  def save_file
    uploaded_io = params[:file]
    # Moving the file to some safe place; as tmp files will be flushed timely
    target = Rails.root.join('public', 'uploads', uploaded_io.original_filename)
    File.open(target, 'wb') do |file|
      file.write(uploaded_io.read)
    end
    target
  end
end
