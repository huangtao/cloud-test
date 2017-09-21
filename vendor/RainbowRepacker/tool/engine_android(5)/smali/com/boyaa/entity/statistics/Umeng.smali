.class public Lcom/boyaa/entity/statistics/Umeng;
.super Ljava/lang/Object;
.source "Umeng.java"


# static fields
.field public static final TAG_LOG:Ljava/lang/String; = "Umeng"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static error(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 6
    .param p0, "act"    # Landroid/app/Activity;
    .param p1, "errText"    # Ljava/lang/String;

    .prologue
    .line 59
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 60
    .local v2, "json":Lorg/json/JSONObject;
    const-string v4, "errContext"

    const-string v5, ""

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 61
    .local v1, "errContext":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    .line 62
    .local v3, "len":I
    const/16 v4, 0x2000

    if-le v3, v4, :cond_0

    .line 64
    add-int/lit16 v4, v3, -0x2000

    invoke-virtual {v1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 66
    :cond_0
    invoke-static {p0, v1}, Lcom/umeng/analytics/MobclickAgent;->reportError(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    .end local v1    # "errContext":Ljava/lang/String;
    .end local v2    # "json":Lorg/json/JSONObject;
    .end local v3    # "len":I
    :goto_0
    return-void

    .line 67
    :catch_0
    move-exception v0

    .line 68
    .local v0, "e":Ljava/lang/Exception;
    const-string v4, "Umeng"

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static event(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 5
    .param p0, "act"    # Landroid/app/Activity;
    .param p1, "event_name"    # Ljava/lang/String;

    .prologue
    .line 34
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 35
    .local v2, "json":Lorg/json/JSONObject;
    const-string v3, "eventId"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 36
    .local v1, "eventId":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 37
    invoke-static {p0, v1}, Lcom/umeng/analytics/MobclickAgent;->onEvent(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .end local v1    # "eventId":Ljava/lang/String;
    .end local v2    # "json":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    return-void

    .line 39
    :catch_0
    move-exception v0

    .line 40
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "Umeng"

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static eventBegin(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0
    .param p0, "act"    # Landroid/app/Activity;
    .param p1, "event_name"    # Ljava/lang/String;

    .prologue
    .line 50
    invoke-static {p0, p1}, Lcom/umeng/analytics/MobclickAgent;->onEventBegin(Landroid/content/Context;Ljava/lang/String;)V

    .line 51
    return-void
.end method

.method public static eventEnd(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0
    .param p0, "act"    # Landroid/app/Activity;
    .param p1, "event_name"    # Ljava/lang/String;

    .prologue
    .line 54
    invoke-static {p0, p1}, Lcom/umeng/analytics/MobclickAgent;->onEventEnd(Landroid/content/Context;Ljava/lang/String;)V

    .line 55
    return-void
.end method

.method public static eventId(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 1
    .param p0, "act"    # Landroid/app/Activity;
    .param p1, "eventId"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 45
    invoke-static {p0, p1}, Lcom/umeng/analytics/MobclickAgent;->onEvent(Landroid/content/Context;Ljava/lang/String;)V

    .line 47
    :cond_0
    return-void
.end method

.method public static init(Landroid/app/Activity;)V
    .locals 3
    .param p0, "act"    # Landroid/app/Activity;

    .prologue
    const/4 v2, 0x0

    .line 19
    invoke-static {v2}, Lcom/umeng/analytics/MobclickAgent;->setDebugMode(Z)V

    .line 21
    const-wide/32 v0, 0xea60

    invoke-static {v0, v1}, Lcom/umeng/analytics/MobclickAgent;->setSessionContinueMillis(J)V

    .line 25
    invoke-static {v2}, Lcom/umeng/analytics/MobclickAgent;->openActivityDurationTrack(Z)V

    .line 28
    return-void
.end method
