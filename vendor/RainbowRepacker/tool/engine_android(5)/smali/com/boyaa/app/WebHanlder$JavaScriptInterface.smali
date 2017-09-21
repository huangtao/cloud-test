.class public Lcom/boyaa/app/WebHanlder$JavaScriptInterface;
.super Ljava/lang/Object;
.source "WebHanlder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/app/WebHanlder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "JavaScriptInterface"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/app/WebHanlder;


# direct methods
.method public constructor <init>(Lcom/boyaa/app/WebHanlder;)V
    .locals 0

    .prologue
    .line 122
    iput-object p1, p0, Lcom/boyaa/app/WebHanlder$JavaScriptInterface;->this$0:Lcom/boyaa/app/WebHanlder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getData(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "json"    # Ljava/lang/String;

    .prologue
    .line 126
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 127
    .local v2, "jo":Lorg/json/JSONObject;
    const-string v3, "cmd"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    .line 128
    .local v0, "cmd":I
    const/16 v3, 0x3e9

    if-ne v0, v3, :cond_0

    .line 129
    iget-object v3, p0, Lcom/boyaa/app/WebHanlder$JavaScriptInterface;->this$0:Lcom/boyaa/app/WebHanlder;

    # invokes: Lcom/boyaa/app/WebHanlder;->getUserData()Ljava/lang/String;
    invoke-static {v3}, Lcom/boyaa/app/WebHanlder;->access$0(Lcom/boyaa/app/WebHanlder;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 135
    .end local v0    # "cmd":I
    .end local v2    # "jo":Lorg/json/JSONObject;
    :goto_0
    return-object v3

    .line 131
    :catch_0
    move-exception v1

    .line 133
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 135
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public sendData(Ljava/lang/String;)V
    .locals 6
    .param p1, "json"    # Ljava/lang/String;

    .prologue
    .line 140
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 141
    .local v2, "jo":Lorg/json/JSONObject;
    const-string v3, "cmd"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    .line 142
    .local v0, "cmd":I
    const-string v3, "wanpg"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "\u6536\u5230js\u56de\u8c03\uff1a"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/app/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    sparse-switch v0, :sswitch_data_0

    .line 155
    iget-object v3, p0, Lcom/boyaa/app/WebHanlder$JavaScriptInterface;->this$0:Lcom/boyaa/app/WebHanlder;

    # invokes: Lcom/boyaa/app/WebHanlder;->send2Lua(Lorg/json/JSONObject;)V
    invoke-static {v3, v2}, Lcom/boyaa/app/WebHanlder;->access$4(Lcom/boyaa/app/WebHanlder;Lorg/json/JSONObject;)V

    .line 162
    .end local v0    # "cmd":I
    .end local v2    # "jo":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 145
    .restart local v0    # "cmd":I
    .restart local v2    # "jo":Lorg/json/JSONObject;
    :sswitch_0
    iget-object v3, p0, Lcom/boyaa/app/WebHanlder$JavaScriptInterface;->this$0:Lcom/boyaa/app/WebHanlder;

    const-string v4, "url"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    # invokes: Lcom/boyaa/app/WebHanlder;->go2Download(Ljava/lang/String;)V
    invoke-static {v3, v4}, Lcom/boyaa/app/WebHanlder;->access$1(Lcom/boyaa/app/WebHanlder;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 158
    .end local v0    # "cmd":I
    .end local v2    # "jo":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 160
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 148
    .end local v1    # "e":Lorg/json/JSONException;
    .restart local v0    # "cmd":I
    .restart local v2    # "jo":Lorg/json/JSONObject;
    :sswitch_1
    :try_start_1
    iget-object v3, p0, Lcom/boyaa/app/WebHanlder$JavaScriptInterface;->this$0:Lcom/boyaa/app/WebHanlder;

    # invokes: Lcom/boyaa/app/WebHanlder;->showEditView(Lorg/json/JSONObject;)V
    invoke-static {v3, v2}, Lcom/boyaa/app/WebHanlder;->access$2(Lcom/boyaa/app/WebHanlder;Lorg/json/JSONObject;)V

    goto :goto_0

    .line 152
    :sswitch_2
    iget-object v3, p0, Lcom/boyaa/app/WebHanlder$JavaScriptInterface;->this$0:Lcom/boyaa/app/WebHanlder;

    # invokes: Lcom/boyaa/app/WebHanlder;->doWebViewBack()V
    invoke-static {v3}, Lcom/boyaa/app/WebHanlder;->access$3(Lcom/boyaa/app/WebHanlder;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 143
    nop

    :sswitch_data_0
    .sparse-switch
        0x3ea -> :sswitch_0
        0x3f5 -> :sswitch_1
        0x3f6 -> :sswitch_2
    .end sparse-switch
.end method
