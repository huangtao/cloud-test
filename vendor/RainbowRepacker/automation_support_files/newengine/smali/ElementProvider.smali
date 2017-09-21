.class public Lcom/boyaa/autotest/ElementProvider;
.super Landroid/content/ContentProvider;
.source "ElementProvider.java"


# static fields
.field private static final AUTHORITY:Ljava/lang/String; = "com.boyaa.test.providers.element"

.field private static final ELEMENTS:I = 0x1

.field private static final GET_HIERARCHY:I = 0x0

.field public static final TESTSUPPORT_TAG:Ljava/lang/String; = "testsupport"

.field private static final matcher:Landroid/content/UriMatcher;


# instance fields
.field private isback:Ljava/lang/Boolean;

.field returnCursor:Landroid/database/MatrixCursor;

.field returnInt:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 47
    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v0, Lcom/boyaa/autotest/ElementProvider;->matcher:Landroid/content/UriMatcher;

    .line 49
    sget-object v0, Lcom/boyaa/autotest/ElementProvider;->matcher:Landroid/content/UriMatcher;

    const-string v1, "com.boyaa.test.providers.element"

    const-string v2, "getHierarchy"

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 50
    sget-object v0, Lcom/boyaa/autotest/ElementProvider;->matcher:Landroid/content/UriMatcher;

    const-string v1, "com.boyaa.test.providers.element"

    const-string v2, "elements"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 51
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 30
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/autotest/ElementProvider;->returnCursor:Landroid/database/MatrixCursor;

    .line 40
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/autotest/ElementProvider;->isback:Ljava/lang/Boolean;

    .line 41
    iput v1, p0, Lcom/boyaa/autotest/ElementProvider;->returnInt:I

    .line 30
    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/autotest/ElementProvider;Ljava/lang/Boolean;)V
    .locals 0

    .prologue
    .line 40
    iput-object p1, p0, Lcom/boyaa/autotest/ElementProvider;->isback:Ljava/lang/Boolean;

    return-void
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    .line 240
    iget-object v0, p0, Lcom/boyaa/autotest/ElementProvider;->returnCursor:Landroid/database/MatrixCursor;

    invoke-virtual {v0}, Landroid/database/MatrixCursor;->close()V

    .line 241
    const/4 v0, 0x0

    return v0
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 230
    const/4 v0, 0x0

    return-object v0
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 235
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()Z
    .locals 1

    .prologue
    .line 57
    const/4 v0, 0x1

    return v0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 10
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;
    .param p5, "sortOrder"    # Ljava/lang/String;

    .prologue
    .line 65
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/boyaa/autotest/ElementProvider;->returnCursor:Landroid/database/MatrixCursor;

    .line 66
    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    iput-object v6, p0, Lcom/boyaa/autotest/ElementProvider;->isback:Ljava/lang/Boolean;

    .line 67
    sget-object v6, Lcom/boyaa/autotest/ElementProvider;->matcher:Landroid/content/UriMatcher;

    invoke-virtual {v6, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v3

    .line 68
    .local v3, "match":I
    const-string v6, "testsupport"

    const-string v7, "start 22222"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    const-string v6, "testsupport"

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    packed-switch v3, :pswitch_data_0

    .line 152
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Unknown URI: "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 73
    :pswitch_0
    const-string v6, "testsupport"

    const-string v7, "start GET_HIERARCHY"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 75
    .local v1, "jsonObject":Lorg/json/JSONObject;
    const-string v6, "getHierarchy"

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Lcom/boyaa/autotest/ElementProvider$1;

    invoke-direct {v8, p0}, Lcom/boyaa/autotest/ElementProvider$1;-><init>(Lcom/boyaa/autotest/ElementProvider;)V

    invoke-static {v6, v7, v8}, Lcom/boyaa/engine/made/CallLuaHelper;->callLuaWithArgs(Ljava/lang/String;Ljava/lang/String;Lcom/boyaa/engine/made/CallLuaHelper$onCallback;)V

    .line 154
    .end local v1    # "jsonObject":Lorg/json/JSONObject;
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 155
    .local v4, "starttime":J
    :goto_1
    iget-object v6, p0, Lcom/boyaa/autotest/ElementProvider;->isback:Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-nez v6, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v4

    const-wide/16 v8, 0x3e8

    div-long/2addr v6, v8

    const-wide/16 v8, 0x8

    cmp-long v6, v6, v8

    if-ltz v6, :cond_3

    .line 164
    :cond_0
    iget-object v6, p0, Lcom/boyaa/autotest/ElementProvider;->isback:Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-nez v6, :cond_1

    .line 165
    const-string v6, "testsupport"

    const-string v7, "isback false"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/boyaa/autotest/ElementProvider;->returnCursor:Landroid/database/MatrixCursor;

    .line 169
    :cond_1
    iget-object v6, p0, Lcom/boyaa/autotest/ElementProvider;->returnCursor:Landroid/database/MatrixCursor;

    if-nez v6, :cond_4

    .line 170
    const-string v6, "testsupport"

    const-string v7, "returnCursor4: null"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    :goto_2
    iget-object v6, p0, Lcom/boyaa/autotest/ElementProvider;->returnCursor:Landroid/database/MatrixCursor;

    return-object v6

    .line 93
    .end local v4    # "starttime":J
    :pswitch_1
    const-string v6, "testsupport"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "selection elements:"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 96
    .local v2, "jsonObject2":Lorg/json/JSONObject;
    const-string v6, "xpath"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 97
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v6

    new-instance v7, Lcom/boyaa/autotest/ElementProvider$2;

    invoke-direct {v7, p0, p3}, Lcom/boyaa/autotest/ElementProvider$2;-><init>(Lcom/boyaa/autotest/ElementProvider;Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Lcom/boyaa/engine/made/AppActivity;->runOnLuaThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 147
    .end local v2    # "jsonObject2":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 148
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 122
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v2    # "jsonObject2":Lorg/json/JSONObject;
    :cond_2
    :try_start_1
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v6

    new-instance v7, Lcom/boyaa/autotest/ElementProvider$3;

    invoke-direct {v7, p0, p3}, Lcom/boyaa/autotest/ElementProvider$3;-><init>(Lcom/boyaa/autotest/ElementProvider;Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Lcom/boyaa/engine/made/AppActivity;->runOnLuaThread(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 157
    .end local v2    # "jsonObject2":Lorg/json/JSONObject;
    .restart local v4    # "starttime":J
    :cond_3
    const-wide/16 v6, 0x64

    :try_start_2
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V

    .line 158
    const-string v6, "testsupport"

    const-string v7, "bbb"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_1

    .line 159
    :catch_1
    move-exception v0

    .line 160
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto/16 :goto_1

    .line 173
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_4
    const-string v6, "testsupport"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "returnCursor4:"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v8, p0, Lcom/boyaa/autotest/ElementProvider;->returnCursor:Landroid/database/MatrixCursor;

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 71
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 8
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    .line 183
    const-string v3, "testsupport"

    const-string v4, "start set element"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    const-string v3, "testsupport"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "selection in LuaGetObj function:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    iput-object v3, p0, Lcom/boyaa/autotest/ElementProvider;->isback:Ljava/lang/Boolean;

    .line 186
    const-string v3, "setElementText"

    new-instance v4, Lcom/boyaa/autotest/ElementProvider$4;

    invoke-direct {v4, p0}, Lcom/boyaa/autotest/ElementProvider$4;-><init>(Lcom/boyaa/autotest/ElementProvider;)V

    invoke-static {v3, p3, v4}, Lcom/boyaa/engine/made/CallLuaHelper;->callLuaWithArgs(Ljava/lang/String;Ljava/lang/String;Lcom/boyaa/engine/made/CallLuaHelper$onCallback;)V

    .line 207
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 208
    .local v1, "starttime":J
    :goto_0
    iget-object v3, p0, Lcom/boyaa/autotest/ElementProvider;->isback:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v1

    const-wide/16 v5, 0x3e8

    div-long/2addr v3, v5

    const-wide/16 v5, 0xc

    cmp-long v3, v3, v5

    if-ltz v3, :cond_1

    .line 217
    :cond_0
    iget-object v3, p0, Lcom/boyaa/autotest/ElementProvider;->returnCursor:Landroid/database/MatrixCursor;

    if-nez v3, :cond_2

    .line 218
    const-string v3, "testsupport"

    const-string v4, "returnCursor4: null"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 223
    :goto_1
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    iput-object v3, p0, Lcom/boyaa/autotest/ElementProvider;->isback:Ljava/lang/Boolean;

    .line 224
    const-string v3, "testsupport"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "returnInt:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v5, p0, Lcom/boyaa/autotest/ElementProvider;->returnInt:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 225
    iget v3, p0, Lcom/boyaa/autotest/ElementProvider;->returnInt:I

    return v3

    .line 210
    :cond_1
    const-wide/16 v3, 0x64

    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    .line 211
    const-string v3, "testsupport"

    const-string v4, "ccc"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 212
    :catch_0
    move-exception v0

    .line 213
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 221
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_2
    const-string v3, "testsupport"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "returnCursor4:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/boyaa/autotest/ElementProvider;->returnCursor:Landroid/database/MatrixCursor;

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method
