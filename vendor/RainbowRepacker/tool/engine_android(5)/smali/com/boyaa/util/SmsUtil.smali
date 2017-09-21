.class public Lcom/boyaa/util/SmsUtil;
.super Ljava/lang/Object;
.source "SmsUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/util/SmsUtil$SendSmsCallBack;
    }
.end annotation


# static fields
.field public static final LOG_TAG:Ljava/lang/String; = "SMS"

.field public static final SMS_DEST_ADDRESS_IS_EMPTY:I = 0x2

.field public static final SMS_SUCCESS:I = 0x0

.field public static final SMS_TEXT_IS_EMPTY:I = 0x1


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static OpenSms(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "content"    # Ljava/lang/String;

    .prologue
    .line 167
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 168
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "android.intent.action.SENDTO"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 169
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 170
    const-string v1, "smsto:"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 171
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 172
    const-string v1, "sms_body"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 174
    :cond_0
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 178
    .end local v0    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 175
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static onSendSms(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/boyaa/util/SmsUtil$SendSmsCallBack;)I
    .locals 19
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "destinationAddress"    # Ljava/lang/String;
    .param p2, "smsText"    # Ljava/lang/String;
    .param p3, "cb"    # Lcom/boyaa/util/SmsUtil$SendSmsCallBack;

    .prologue
    .line 101
    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 102
    const/4 v3, 0x2

    .line 162
    :goto_0
    return v3

    .line 104
    :cond_0
    invoke-static/range {p2 .. p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 105
    const/4 v3, 0x1

    goto :goto_0

    .line 107
    :cond_1
    invoke-static {}, Landroid/telephony/SmsManager;->getDefault()Landroid/telephony/SmsManager;

    move-result-object v2

    .line 110
    .local v2, "smsManager":Landroid/telephony/SmsManager;
    const-string v15, "SENT_SMS_ACTION"

    .line 111
    .local v15, "SENT_SMS_ACTION":Ljava/lang/String;
    new-instance v17, Landroid/content/Intent;

    move-object/from16 v0, v17

    invoke-direct {v0, v15}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 112
    .local v17, "sentIntent":Landroid/content/Intent;
    const/4 v3, 0x0

    .line 113
    const/4 v4, 0x0

    .line 112
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-static {v0, v3, v1, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    .line 115
    .local v6, "sentPI":Landroid/app/PendingIntent;
    new-instance v3, Lcom/boyaa/util/SmsUtil$3;

    move-object/from16 v0, p3

    move-object/from16 v1, p0

    invoke-direct {v3, v0, v1}, Lcom/boyaa/util/SmsUtil$3;-><init>(Lcom/boyaa/util/SmsUtil$SendSmsCallBack;Landroid/content/Context;)V

    .line 135
    new-instance v4, Landroid/content/IntentFilter;

    invoke-direct {v4, v15}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 115
    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 138
    const-string v14, "DELIVERED_SMS_ACTION"

    .line 140
    .local v14, "DELIVERED_SMS_ACTION":Ljava/lang/String;
    new-instance v16, Landroid/content/Intent;

    move-object/from16 v0, v16

    invoke-direct {v0, v14}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 141
    .local v16, "deliverIntent":Landroid/content/Intent;
    const/4 v3, 0x0

    .line 142
    const/4 v4, 0x0

    .line 141
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-static {v0, v3, v1, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v7

    .line 152
    .local v7, "deliverPI":Landroid/app/PendingIntent;
    :try_start_0
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x46

    if-le v3, v4, :cond_3

    .line 153
    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Landroid/telephony/SmsManager;->divideMessage(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v18

    .line 154
    .local v18, "smsTextList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface/range {v18 .. v18}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_2

    .line 162
    .end local v18    # "smsTextList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_2
    const/4 v3, 0x0

    goto :goto_0

    .line 154
    .restart local v18    # "smsTextList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_2
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 155
    .local v5, "text":Ljava/lang/String;
    const/4 v4, 0x0

    move-object/from16 v3, p1

    invoke-virtual/range {v2 .. v7}, Landroid/telephony/SmsManager;->sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)V

    goto :goto_1

    .line 160
    .end local v5    # "text":Ljava/lang/String;
    .end local v18    # "smsTextList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_0
    move-exception v3

    goto :goto_2

    .line 158
    :cond_3
    const/4 v10, 0x0

    move-object v8, v2

    move-object/from16 v9, p1

    move-object/from16 v11, p2

    move-object v12, v6

    move-object v13, v7

    invoke-virtual/range {v8 .. v13}, Landroid/telephony/SmsManager;->sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2
.end method

.method public static openSmsEdit(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 8
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "jsonstr"    # Ljava/lang/String;

    .prologue
    .line 181
    const-string v6, ""

    if-ne p1, v6, :cond_0

    .line 207
    :goto_0
    return-void

    .line 184
    :cond_0
    const/4 v3, 0x0

    .line 187
    .local v3, "jsonObject":Lorg/json/JSONObject;
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 189
    .end local v3    # "jsonObject":Lorg/json/JSONObject;
    .local v4, "jsonObject":Lorg/json/JSONObject;
    :try_start_1
    const-string v6, "content"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 190
    .local v0, "content":Ljava/lang/String;
    const-string v5, "sms:"

    .line 200
    .local v5, "nums":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "number"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 201
    new-instance v2, Landroid/content/Intent;

    const-string v6, "android.intent.action.SENDTO"

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-direct {v2, v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 202
    .local v2, "intent":Landroid/content/Intent;
    const-string v6, "sms_body"

    invoke-virtual {v2, v6, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 203
    invoke-virtual {p0, v2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v3, v4

    .line 204
    .end local v4    # "jsonObject":Lorg/json/JSONObject;
    .restart local v3    # "jsonObject":Lorg/json/JSONObject;
    goto :goto_0

    .end local v0    # "content":Ljava/lang/String;
    .end local v2    # "intent":Landroid/content/Intent;
    .end local v5    # "nums":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 205
    .local v1, "e":Lorg/json/JSONException;
    :goto_1
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 204
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v3    # "jsonObject":Lorg/json/JSONObject;
    .restart local v4    # "jsonObject":Lorg/json/JSONObject;
    :catch_1
    move-exception v1

    move-object v3, v4

    .end local v4    # "jsonObject":Lorg/json/JSONObject;
    .restart local v3    # "jsonObject":Lorg/json/JSONObject;
    goto :goto_1
.end method

.method public static sendSms(Landroid/app/Activity;Ljava/lang/Object;)V
    .locals 8
    .param p0, "act"    # Landroid/app/Activity;
    .param p1, "data"    # Ljava/lang/Object;

    .prologue
    .line 42
    const/4 v1, 0x0

    .line 43
    .local v1, "jsonResult":Lorg/json/JSONObject;
    const-string v4, ""

    .line 44
    .local v4, "toPhone":Ljava/lang/String;
    const-string v3, ""

    .line 46
    .local v3, "smsContext":Ljava/lang/String;
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    check-cast p1, Ljava/lang/String;

    .end local p1    # "data":Ljava/lang/Object;
    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .end local v1    # "jsonResult":Lorg/json/JSONObject;
    .local v2, "jsonResult":Lorg/json/JSONObject;
    :try_start_1
    const-string v5, "toPhone"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 48
    const-string v5, "smsContext"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 49
    const-string v5, "SMSUTIL"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "toPhone:"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "  smsContext:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    new-instance v5, Lcom/boyaa/util/SmsUtil$1;

    invoke-direct {v5}, Lcom/boyaa/util/SmsUtil$1;-><init>()V

    invoke-static {p0, v4, v3, v5}, Lcom/boyaa/util/SmsUtil;->onSendSms(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/boyaa/util/SmsUtil$SendSmsCallBack;)I
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v1, v2

    .line 98
    .end local v2    # "jsonResult":Lorg/json/JSONObject;
    .restart local v1    # "jsonResult":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 86
    :catch_0
    move-exception v0

    .line 87
    .local v0, "e":Lorg/json/JSONException;
    :goto_1
    sget-object v5, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v6, Lcom/boyaa/util/SmsUtil$2;

    invoke-direct {v6}, Lcom/boyaa/util/SmsUtil$2;-><init>()V

    invoke-virtual {v5, v6}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 93
    const-string v5, "SMSUTIL"

    invoke-virtual {v0}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 86
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v1    # "jsonResult":Lorg/json/JSONObject;
    .restart local v2    # "jsonResult":Lorg/json/JSONObject;
    :catch_1
    move-exception v0

    move-object v1, v2

    .end local v2    # "jsonResult":Lorg/json/JSONObject;
    .restart local v1    # "jsonResult":Lorg/json/JSONObject;
    goto :goto_1
.end method
