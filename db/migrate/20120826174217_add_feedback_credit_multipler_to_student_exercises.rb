# Copyright 2011-2012 Rice University. Licensed under the Affero General Public 
# License version 3 or later.  See the COPYRIGHT file for details.

class AddFeedbackCreditMultiplerToStudentExercises < ActiveRecord::Migration
  def change
    add_column :student_exercises, :feedback_credit_multiplier, :float, :default => 1
  end
end
