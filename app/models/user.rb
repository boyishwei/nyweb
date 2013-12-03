class User < ActiveRecord::Base
  attr_accessible :address, :email, :password,:password_confirmation, :phone, :username, :remember_me, :avatar
  attr_accessor :remember_me
  has_many :comments
  has_many :leave_messages
  mount_uploader :avatar, AvatarUploader

  #has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token, :unless => Proc.new { |u| u.password.blank? }

  validates :username, presence: {message: "用户名不能为空"}, 
  length: { maximum: 50, message: "用户名不能超过50个字符" },
  uniqueness: { case_sensitive: false, message:"用户名已经被占用" }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: { message:"email地址不能为空" },
  format: { with: VALID_EMAIL_REGEX,message:"email地址不正确，请确认" },
  uniqueness: { case_sensitive: false, message:"email地址已经被使用" }

  validates :phone, 	presence: {message: "手机号码不能为空"}, 
  length: {is:11,message:"手机号码长度不正确"}, 
  numericality: { only_integer: true, message:"手机号码只能包含数字" }, 
  uniqueness: { message:"该手机号码已经被注册使用" }
  validates :password, 	presence: {message: "密码不能为空"}, 
  length: { minimum: 6,message:"密码至少为6位数字及字母" }, 
  confirmation: {message:"两次输入的密码不匹配"} , :if => :password_required?
  validates :password_confirmation, presence: {message: "确认密码不能为空"}, :if => :password_required?

  has_secure_password

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

  private
  def password_required?
  	password_digest.blank? || !password.blank?
  end
end
