class ApplicationController < ActionController::Base
  # protect_from_forgery with: :null_session
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # before_filter :authenticate_user!
  before_action :set_common_chunk_name
  protect_from_forgery with: :null_session
  after_action :set_csrf_cookie
  include DeviseTokenAuth::Concerns::SetUserByToken
  def set_common_chunk_name
    @common_chunk = script_for('main')
  end
  def set_csrf_cookie
    response.headers['xsrf-token'] = form_authenticity_token if protect_against_forgery?
  end

  def verified_request?
    super || valid_authenticity_token?(session, request.headers['XSRF-TOKEN'])
  end

  def script_for(bundle)
    path = Rails.root.join('app', 'views', 'webpack-assets.json')
    file = File.read(path)
    json = JSON.parse(file)
    json[bundle]['js']
  end

  # Exceptions
  rescue_from NotEditableDocument do |exception|
    render json: {error: 'No se puede editar documentos confirmados o publicados'}, status: 400
  end

  rescue_from NotPublishedResolvingBrief do |exception|
    render json: {error: 'Solo es posible resolver escritos publicados'}, status: 400
  end

  rescue_from CanCan::AccessDenied do |exception|
    render json: {error: 'Usuario no autorizado'}, status: 401
  end

  def test
    
  end

  def current_ability
    p 'checking ability'
    if current_user
      p 'current_user'
      @current_ability ||= Ability.new(current_user)
    elsif current_entity_user
      p 'current_entity_user'
      @current_ability ||= Ability.new(current_entity_user)
    else
      p 'not user found '
      @current_ability ||= Ability.new(nil)
    end
  end

  def check_blocked_login
    setting = Setting.find_by(code: 'blockLogin')
    if setting && setting.value === 'BLOCK'
      render json: {message: 'No está perimito el inicio de sesión.'}, status: 403
    end
  end
end
