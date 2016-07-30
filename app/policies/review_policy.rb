# Simple policy for reviews
class ReviewPolicy
  attr_reader :user, :review

  def initialize(user, review)
    @user   = user
    @review = review
  end

  def update?
    admin_or_owner
  end

  def destroy?
    admin_or_owner
  end

  private

  def admin_or_owner
    user.admin? || user == review.user
  end
end
