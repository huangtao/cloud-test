.class public Lcom/boyaa/entity/godsdk/getui/GeTuiHelper;
.super Ljava/lang/Object;
.source "GeTuiHelper.java"


# static fields
.field private static final DICT_GETUI_ID:Ljava/lang/String; = "getui_id"

.field private static final DICT_NAME:Ljava/lang/String; = "getui"

.field private static final KEY_CLIENT_ID:Ljava/lang/String; = "last_client_id"

.field private static final PREFERENCE_NAME:Ljava/lang/String;

.field private static currentClientID:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const-class v0, Lcom/boyaa/entity/godsdk/getui/GeTuiHelper;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/boyaa/entity/godsdk/getui/GeTuiHelper;->PREFERENCE_NAME:Ljava/lang/String;

    .line 23
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/entity/godsdk/getui/GeTuiHelper;->currentClientID:Ljava/lang/String;

    .line 103
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCurrentClientId()Ljava/lang/String;
    .locals 2

    .prologue
    .line 35
    sget-object v1, Lcom/boyaa/entity/godsdk/getui/GeTuiHelper;->PREFERENCE_NAME:Ljava/lang/String;

    monitor-enter v1

    .line 36
    :try_start_0
    sget-object v0, Lcom/boyaa/entity/godsdk/getui/GeTuiHelper;->currentClientID:Ljava/lang/String;

    monitor-exit v1

    return-object v0

    .line 35
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static getCurrentGetuiClientIdForLua()V
    .locals 3

    .prologue
    .line 110
    invoke-static {}, Lcom/boyaa/entity/godsdk/getui/GeTuiHelper;->getCurrentClientId()Ljava/lang/String;

    move-result-object v0

    .line 111
    .local v0, "clientId":Ljava/lang/String;
    const-string v1, "getui"

    const-string v2, "getui_id"

    invoke-static {v1, v2, v0}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    return-void
.end method

.method public static getGetuiClientIdForLua(Ljava/lang/String;)V
    .locals 2
    .param p0, "clientid"    # Ljava/lang/String;

    .prologue
    .line 81
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 100
    :goto_0
    return-void

    .line 87
    :cond_0
    :try_start_0
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v1, Lcom/boyaa/entity/godsdk/getui/GeTuiHelper$1;

    invoke-direct {v1, p0}, Lcom/boyaa/entity/godsdk/getui/GeTuiHelper$1;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 97
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static loadLastClientId(Landroid/content/Context;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 45
    sget-object v2, Lcom/boyaa/entity/godsdk/getui/GeTuiHelper;->PREFERENCE_NAME:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 46
    .local v1, "pref":Landroid/content/SharedPreferences;
    const-string v2, "last_client_id"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 47
    .local v0, "lastClientId":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 52
    :goto_0
    return-void

    .line 50
    :cond_0
    invoke-static {v0}, Lcom/boyaa/entity/godsdk/getui/GeTuiHelper;->setCurrentClientId(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static saveLastClientId(Landroid/content/Context;Ljava/lang/String;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "clientId"    # Ljava/lang/String;

    .prologue
    .line 61
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 73
    :goto_0
    return-void

    .line 66
    :cond_0
    :try_start_0
    sget-object v2, Lcom/boyaa/entity/godsdk/getui/GeTuiHelper;->PREFERENCE_NAME:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 67
    .local v1, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 68
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v2, "last_client_id"

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 69
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 70
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v1    # "pref":Landroid/content/SharedPreferences;
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static setCurrentClientId(Ljava/lang/String;)V
    .locals 2
    .param p0, "clientid"    # Ljava/lang/String;

    .prologue
    .line 26
    sget-object v1, Lcom/boyaa/entity/godsdk/getui/GeTuiHelper;->PREFERENCE_NAME:Ljava/lang/String;

    monitor-enter v1

    .line 27
    :try_start_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 28
    monitor-exit v1

    .line 32
    :goto_0
    return-void

    .line 30
    :cond_0
    sput-object p0, Lcom/boyaa/entity/godsdk/getui/GeTuiHelper;->currentClientID:Ljava/lang/String;

    .line 26
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
