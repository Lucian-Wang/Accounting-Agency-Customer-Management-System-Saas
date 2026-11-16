<?php
// Set your own deployment configuration through environment variables.
return [
    'mch_id' => getenv('WECHAT_MCH_ID') ?: '',
    'appid' => getenv('WECHAT_APP_ID') ?: '',
    'api_key' => getenv('WECHAT_API_KEY') ?: '',
    'notify_url' => getenv('WECHAT_NOTIFY_URL') ?: '',
];
