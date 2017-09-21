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
    .line 210
    iget-object v0, p0, Lcom/boyaa/autotest/ElementProvider;->returnCursor:Landroid/database/MatrixCursor;

    invoke-virtual {v0}, Landroid/database/MatrixCursor;->close()V

    .line 211
    const/4 v0, 0x0

    return v0
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 200
    const/4 v0, 0x0

    return-object v0
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 205
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
    .locals 7
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;
    .param p5, "sortOrder"    # Ljava/lang/String;

    .prologue
    .line 66
    sget-object v4, Lcom/boyaa/autotest/ElementProvider;->matcher:Landroid/content/UriMatcher;

    invoke-virtual {v4, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v3

    .line 67
    .local v3, "match":I
    const-string v4, "testsupport"

    const-string v5, "start 22222"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    const-string v4, "testsupport"

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    packed-switch v3, :pswitch_data_0

    .line 137
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Unknown URI: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 72
    :pswitch_0
    const-string v4, "testsupport"

    const-string v5, "start GET_HIERARCHY"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 74
    .local v1, "jsonObject":Lorg/json/JSONObject;
    const-string v4, "getHierarchy"

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lcom/boyaa/autotest/ElementProvider$1;

    invoke-direct {v6, p0}, Lcom/boyaa/autotest/ElementProvider$1;-><init>(Lcom/boyaa/autotest/ElementProvider;)V

    invoke-static {v4, v5, v6}, Lcom/boyaa/engine/made/CallLuaHelper;->callLuaWithArgs(Ljava/lang/String;Ljava/lang/String;Lcom/boyaa/engine/made/CallLuaHelper$onCallback;)V

    .line 139
    .end local v1    # "jsonObject":Lorg/json/JSONObject;
    :goto_0
    iget-object v4, p0, Lcom/boyaa/autotest/ElementProvider;->isback:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 148
    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    iput-object v4, p0, Lcom/boyaa/autotest/ElementProvider;->isback:Ljava/lang/Boolean;

    .line 149
    iget-object v4, p0, Lcom/boyaa/autotest/ElementProvider;->returnCursor:Landroid/database/MatrixCursor;

    if-nez v4, :cond_2

    .line 150
    const-string v4, "testsupport"

    const-string v5, "returnCursor4: null"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    :goto_1
    iget-object v4, p0, Lcom/boyaa/autotest/ElementProvider;->returnCursor:Landroid/database/MatrixCursor;

    return-object v4

    .line 92
    :pswitch_1
    const-string v4, "testsupport"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "selection elements:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 95
    .local v2, "jsonObject2":Lorg/json/JSONObject;
    const-string v4, "xpath"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 96
    const-string v4, "getNodesByXPath"

    new-instance v5, Lcom/boyaa/autotest/ElementProvider$2;

    invoke-direct {v5, p0}, Lcom/boyaa/autotest/ElementProvider$2;-><init>(Lcom/boyaa/autotest/ElementProvider;)V

    invoke-static {v4, p3, v5}, Lcom/boyaa/engine/made/CallLuaHelper;->callLuaWithArgs(Ljava/lang/String;Ljava/lang/String;Lcom/boyaa/engine/made/CallLuaHelper$onCallback;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 132
    .end local v2    # "jsonObject2":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 133
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 114
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v2    # "jsonObject2":Lorg/json/JSONObject;
    :cond_0
    :try_start_1
    const-string v4, "getElements"

    new-instance v5, Lcom/boyaa/autotest/ElementProvider$3;

    invoke-direct {v5, p0}, Lcom/boyaa/autotest/ElementProvider$3;-><init>(Lcom/boyaa/autotest/ElementProvider;)V

    invoke-static {v4, p3, v5}, Lcom/boyaa/engine/made/CallLuaHelper;->callLuaWithArgs(Ljava/lang/String;Ljava/lang/String;Lcom/boyaa/engine/made/CallLuaHelper$onCallback;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 141
    .end local v2    # "jsonObject2":Lorg/json/JSONObject;
    :cond_1
    const-wide/16 v4, 0x1f4

    :try_start_2
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V

    .line 142
    const-string v4, "testsupport"

    const-string v5, "bbb"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 143
    :catch_1
    move-exception v0

    .line 144
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 153
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_2
    const-string v4, "testsupport"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "returnCursor4:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lcom/boyaa/autotest/ElementProvider;->returnCursor:Landroid/database/MatrixCursor;

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 70
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 4
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    .line 162
    const-string v1, "testsupport"

    const-string v2, "start set element"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    const-string v1, "testsupport"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "selection in LuaGetObj function:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    const-string v1, "setElementText"

    new-instance v2, Lcom/boyaa/autotest/ElementProvider$4;

    invoke-direct {v2, p0}, Lcom/boyaa/autotest/ElementProvider$4;-><init>(Lcom/boyaa/autotest/ElementProvider;)V

    invoke-static {v1, p3, v2}, Lcom/boyaa/engine/made/CallLuaHelper;->callLuaWithArgs(Ljava/lang/String;Ljava/lang/String;Lcom/boyaa/engine/made/CallLuaHelper$onCallback;)V

    .line 185
    :goto_0
    iget-object v1, p0, Lcom/boyaa/autotest/ElementProvider;->isback:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 193
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/boyaa/autotest/ElementProvider;->isback:Ljava/lang/Boolean;

    .line 194
    const-string v1, "testsupport"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "returnInt:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p0, Lcom/boyaa/autotest/ElementProvider;->returnInt:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    iget v1, p0, Lcom/boyaa/autotest/ElementProvider;->returnInt:I

    return v1

    .line 187
    :cond_0
    const-wide/16 v1, 0x64

    :try_start_0
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 188
    :catch_0
    move-exception v0

    .line 189
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0
.end method
