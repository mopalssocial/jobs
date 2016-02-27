# Challenge 2

For challenge2, we have given you some starter code.

## The Context

At MoPals, we have a number of **Business**es on our platform. Each **Business** _has one_ associated **Balance** record, which holds the number of Coins that business is able to reward to their customers. Please see `schema.rd` for the formalization of this model.

A **Business** may also _have many_ **BusinessReward**s. Once in a while, an administrator may decide to give a business a reward just for being great. A controller under an administration namespace will build one of these reward objects, by calling `create_and_administer`.

For a long time, this has worked great! But the problem is that sometimes administrators are needing to revoke the reward from the business, and it's causing too much developer intervention.

## The New Requirements

We need to augment **BusinessReward** to make it a revokable reward. This will need to be able to undo the rewarding action, as well as send a new kind of notification to the business telling them that the reward has been revoked. 

Please augment the class however you would like to. If you are making any changes to the data structure, please change `schema.rb` as you see fit.

If you need to add any new types of records, please create the classes as you need, but also add their structure to `schema.rb`.

The augmentation must:
* guarentee that a business can't be rewarded twice by the same reward
* guarentee that a reward can only be revoked once, and only after the reward has been given

## Testing

Please show the test cases in `business_reward_spec.rb`. This does not have to be an operational rspec file, just outline the test cases that you would cover such that they guarentee the requirements specified above. Modify the current test cases however you need to in order to fit your new implementation.
