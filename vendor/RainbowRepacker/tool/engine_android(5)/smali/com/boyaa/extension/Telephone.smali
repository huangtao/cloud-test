.class public Lcom/boyaa/extension/Telephone;
.super Ljava/lang/Object;
.source "Telephone.java"


# static fields
.field static dialog:Landroid/app/Dialog;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/extension/Telephone;->dialog:Landroid/app/Dialog;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static autoDial(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 5
    .param p0, "act"    # Landroid/app/Activity;
    .param p1, "jsonstr"    # Ljava/lang/String;

    .prologue
    .line 33
    const-string v4, ""

    if-ne p1, v4, :cond_0

    .line 48
    :goto_0
    return-void

    .line 37
    :cond_0
    const-string v3, "0"

    .line 38
    .local v3, "telNumber":Ljava/lang/String;
    const/4 v1, 0x0

    .line 40
    .local v1, "jsonObject":Lorg/json/JSONObject;
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .end local v1    # "jsonObject":Lorg/json/JSONObject;
    .local v2, "jsonObject":Lorg/json/JSONObject;
    if-eqz v2, :cond_1

    .line 42
    :try_start_1
    const-string v4, "tel"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v3

    move-object v1, v2

    .line 47
    .end local v2    # "jsonObject":Lorg/json/JSONObject;
    .restart local v1    # "jsonObject":Lorg/json/JSONObject;
    :goto_1
    invoke-static {p0, v3}, Lcom/boyaa/extension/Telephone;->dial(Landroid/app/Activity;Ljava/lang/String;)V

    goto :goto_0

    .line 44
    :catch_0
    move-exception v0

    .line 45
    .local v0, "e":Lorg/json/JSONException;
    :goto_2
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    .line 44
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v1    # "jsonObject":Lorg/json/JSONObject;
    .restart local v2    # "jsonObject":Lorg/json/JSONObject;
    :catch_1
    move-exception v0

    move-object v1, v2

    .end local v2    # "jsonObject":Lorg/json/JSONObject;
    .restart local v1    # "jsonObject":Lorg/json/JSONObject;
    goto :goto_2

    .end local v1    # "jsonObject":Lorg/json/JSONObject;
    .restart local v2    # "jsonObject":Lorg/json/JSONObject;
    :cond_1
    move-object v1, v2

    .end local v2    # "jsonObject":Lorg/json/JSONObject;
    .restart local v1    # "jsonObject":Lorg/json/JSONObject;
    goto :goto_1
.end method

.method public static autoSelectDial(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 11
    .param p0, "act"    # Landroid/app/Activity;
    .param p1, "jsonstr"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    .line 56
    const-string v7, ""

    if-ne p1, v7, :cond_0

    .line 90
    :goto_0
    return-void

    .line 59
    :cond_0
    const/4 v4, 0x0

    .line 61
    .local v4, "jsonArray":Lorg/json/JSONArray;
    :try_start_0
    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .end local v4    # "jsonArray":Lorg/json/JSONArray;
    .local v5, "jsonArray":Lorg/json/JSONArray;
    :try_start_1
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v7

    new-array v6, v7, [Ljava/lang/String;

    .line 63
    .local v6, "numList":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-lt v2, v7, :cond_2

    .line 66
    array-length v7, v6

    if-le v7, v8, :cond_3

    .line 67
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 68
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const-string v7, "\u9009\u62e9\u53f7\u7801"

    invoke-virtual {v0, v7}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 69
    new-instance v7, Lcom/boyaa/extension/Telephone$1;

    invoke-direct {v7, v6, p0}, Lcom/boyaa/extension/Telephone$1;-><init>([Ljava/lang/String;Landroid/app/Activity;)V

    invoke-virtual {v0, v6, v7}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 79
    sget-object v7, Lcom/boyaa/extension/Telephone;->dialog:Landroid/app/Dialog;

    if-eqz v7, :cond_1

    sget-object v7, Lcom/boyaa/extension/Telephone;->dialog:Landroid/app/Dialog;

    invoke-virtual {v7}, Landroid/app/Dialog;->isShowing()Z

    move-result v7

    if-nez v7, :cond_4

    .line 80
    :cond_1
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v7

    sput-object v7, Lcom/boyaa/extension/Telephone;->dialog:Landroid/app/Dialog;

    move-object v4, v5

    .line 82
    .end local v5    # "jsonArray":Lorg/json/JSONArray;
    .restart local v4    # "jsonArray":Lorg/json/JSONArray;
    goto :goto_0

    .line 64
    .end local v0    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v4    # "jsonArray":Lorg/json/JSONArray;
    .restart local v5    # "jsonArray":Lorg/json/JSONArray;
    :cond_2
    invoke-virtual {v5, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v2

    .line 63
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 82
    :cond_3
    array-length v7, v6

    if-ne v7, v8, :cond_4

    .line 83
    new-instance v3, Landroid/content/Intent;

    const-string v7, "android.intent.action.DIAL"

    invoke-direct {v3, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 84
    .local v3, "intent":Landroid/content/Intent;
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "tel:"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v8, 0x0

    aget-object v8, v6, v8

    const-string v9, "-"

    const-string v10, ""

    invoke-virtual {v8, v9, v10}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-virtual {v3, v7}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 85
    invoke-virtual {p0, v3}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v4, v5

    .line 87
    .end local v5    # "jsonArray":Lorg/json/JSONArray;
    .restart local v4    # "jsonArray":Lorg/json/JSONArray;
    goto :goto_0

    .end local v2    # "i":I
    .end local v3    # "intent":Landroid/content/Intent;
    .end local v6    # "numList":[Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 88
    .local v1, "e":Lorg/json/JSONException;
    :goto_2
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 87
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v4    # "jsonArray":Lorg/json/JSONArray;
    .restart local v5    # "jsonArray":Lorg/json/JSONArray;
    :catch_1
    move-exception v1

    move-object v4, v5

    .end local v5    # "jsonArray":Lorg/json/JSONArray;
    .restart local v4    # "jsonArray":Lorg/json/JSONArray;
    goto :goto_2

    .end local v4    # "jsonArray":Lorg/json/JSONArray;
    .restart local v2    # "i":I
    .restart local v5    # "jsonArray":Lorg/json/JSONArray;
    .restart local v6    # "numList":[Ljava/lang/String;
    :cond_4
    move-object v4, v5

    .end local v5    # "jsonArray":Lorg/json/JSONArray;
    .restart local v4    # "jsonArray":Lorg/json/JSONArray;
    goto :goto_0
.end method

.method public static dial(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 4
    .param p0, "act"    # Landroid/app/Activity;
    .param p1, "telNumber"    # Ljava/lang/String;

    .prologue
    .line 93
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.DIAL"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 94
    .local v0, "intent":Landroid/content/Intent;
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "tel:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "-"

    const-string v3, ""

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 95
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 96
    return-void
.end method
