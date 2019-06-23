class User < ApplicationRecord
  has_many :attendances, dependent: :destroy
  
  enum gender: { unknown: 0, male: 1, female: 2, other: 9 }
  
  # ユーザー名による絞り込み
  scope :get_by_name, ->(name) {
  where("name like ?", "%#{name}%")
  }
  # 性別による絞り込み
  scope :get_by_gender, ->(gender) {
  where(gender: gender)
  }
  
  # 「remember_token」という仮想の属性を作成します。
  attr_accessor :remember_token
  before_save { self.email = email.downcase }

  validates :name,  presence: true, length: { maximum: 50 }

  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true    
  validates :department, length: { in: 2..50 }, allow_blank: true
  validates :basic_time, presence: true
  validates :work_time, presence: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  VALID_NUMBER_REGEX = /\A\d{1,4}\z/ 
  validates :employee_number, length: { maximum: 4 },
                    format: { with: VALID_NUMBER_REGEX },
                    uniqueness: true
  VALID_UID_REGEX = /\A[a-zA-Z0-9]+\z/
  validates :uid, length: { maximum: 16 },
                    format: { with: VALID_UID_REGEX }
  
  # 渡された文字列のハッシュ値を返します。
  def User.digest(string)
    cost = 
      if ActiveModel::SecurePassword.min_cost
        BCrypt::Engine::MIN_COST
      else
        BCrypt::Engine.cost
      end
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムなトークンを返します。
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  # 永続セッションのためハッシュ化したトークンをデータベースに記憶します。
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  # トークンがダイジェストと一致すればtrueを返します。
  def authenticated?(remember_token)
    # ダイジェストが存在しない場合はfalseを返して終了します。
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  # ユーザーのログイン情報を破棄します。
  def forget
    update_attribute(:remember_digest, nil)
  end

end