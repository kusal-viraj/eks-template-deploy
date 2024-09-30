--------Amal------2.6.91-----------

CREATE TABLE `papertrl_cloudflare_config` (
  `id` int DEFAULT NULL,
  `create_dns_api` varchar(400) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `ttl` int DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `proxied` tinyint DEFAULT NULL,
  `x_auth_email` varchar(200) DEFAULT NULL,
  `x_auth_key` varchar(400) DEFAULT NULL,
  `create_dns_failed_notify_email` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
