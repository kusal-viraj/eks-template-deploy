------------------------Indra----------2.2.20----------------------

REPLACE INTO `common_notification_email_template` (`id`, `template_name`, `subject`, `template_data`, `event_id`, `status`, `created_by`, `created_on`, `update_by`, `update_on`, `delete_by`, `delete_on`) VALUES (27, 'PAYMENT_REQUEST_ASSIGNEE_LIST_EMPLTY', 'No user found in the approval group to approval', '<html>   <head>     <meta charset="UTF-8">     <meta name="viewport" content="width=device-width, initial-scale=1.0">   </head>   <body>     <table style="color: #207580;">       <tr>         <td style="font-weight: bold">Dear <span id="EMAIL_SEND_TO">name of admin users</span>, </td>       </tr>       <tr>         <td></td>       </tr>       <tr>         <td></td>       </tr>       <tr>         <td></td>       </tr>       <tr>         <td></td>       </tr>       <tr>         <td></td>       </tr>       <tr style="margin-left: 250px">         <td>           <ul></ul>           <ul></ul>A payment request has been submitted by <span id="CREATED_BY">created by</span> for the approval of <span id="APPROVAL_GROUP">Project Manager</span> approval group, But there is no user found in this approval group.         </td>       </tr>       <tr>         <td></td>       </tr>       <tr>         <td></td>       </tr>       <tr>         <td></td>       </tr>       <tr>         <td>If you have any comments or questions, please do not hesitate to contact us at <span style="font-weight: bold">             <a href="mailto:support@papertrl.com">support@papertrl.com.</a>           </span>         </td>       </tr>       <tr>         <td></td>       </tr>       <tr>         <td></td>       </tr>       <tr>         <td></td>       </tr>       <tr>         <td></td>       </tr>       <tr>         <td></td>       </tr>       <tr>         <td></td>       </tr>       <tr style="margin-top: 65px">         <td>           <span style="font-weight: bold">             <ul></ul>             <ul></ul>             <ul></ul>             <ul></ul>Thank You!           </span>         </td>       </tr>       <tr>         <td>           <img style="width: 170px;height: 45px;" src="https://papertrl.com/wp-content/uploads/2019/09/logo.png" />         </td>       </tr>       <tr>         <td>This email is an automated notification, Replies to this message will not be read or responded to. We\'re happy to help you with any questions or concerns you may have. Please contact us directly 24/7 via <span style="font-weight: bold">support@papertrl.com</span>           <p class="MsoNormal">             <span style="font-size:8.0pt;color:#207580">CONFIDENTIALITY NOTICE: This e-mail transmission, and any attachments, is intended only for the use of PaperTrl Inc. or recipient named above and may contain information that is confidential, privileged and exempt from disclosure under applicable law. If you are not the intended recipient or authorized to receive this message for the recipient, you must not use, copy, disclose or take any action based on this message or any information herein. If you have received this message in error, please advise the sender immediately.</span>             <span style="font-size:8.0pt;color:#014708"></span>           </p>           <p>             <span style="font-size:18.0pt;font-family:Webdings;color:green">P</span>             <span style="color:black"></span>             <span style="font-size:10.0pt;font-family:&quot;Helvetica&quot;,sans-serif;color:green">Be Environmentally Responsible. Please don\'t print this e-mail unless you really need to.</span>             <u></u>             <u></u>           </p>         </td>       </tr>     </table>   </body> </html>', 22, 'A', 'admin', '2021-09-22', NULL, NULL, NULL, NULL);