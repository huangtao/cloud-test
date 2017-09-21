.class public Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;
.super Landroid/database/ContentObserver;
.source "LuaCallManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SmsObserver"
.end annotation


# static fields
.field private static final SMS_URI:Ljava/lang/String; = "content://sms"

.field private static final SMS_URI_INBOX:Ljava/lang/String; = "content://sms/inbox"


# instance fields
.field private isStop:Z

.field private mContext:Landroid/app/Activity;

.field final synthetic this$0:Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;


# direct methods
.method public constructor <init>(Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;Landroid/app/Activity;)V
    .locals 1
    .param p2, "activity"    # Landroid/app/Activity;

    .prologue
    .line 1450
    iput-object p1, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;->this$0:Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager;

    .line 1451
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 1452
    iput-object p2, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;->mContext:Landroid/app/Activity;

    .line 1453
    return-void
.end method


# virtual methods
.method public getNumber(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "smdBody"    # Ljava/lang/String;

    .prologue
    .line 1518
    const-string v2, "\\d{4,}"

    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    .line 1519
    .local v1, "regex":Ljava/util/regex/Pattern;
    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 1520
    .local v0, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1522
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    .line 1523
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    .line 1524
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v2

    .line 1526
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public isBoyaaSms(Ljava/lang/String;)Z
    .locals 2
    .param p1, "smdBody"    # Ljava/lang/String;

    .prologue
    .line 1532
    const-string v1, "\u535a\u96c5\u79d1\u6280"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 1533
    .local v0, "regex":Ljava/util/regex/Pattern;
    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    return v1
.end method

.method public onChange(Z)V
    .locals 11
    .param p1, "selfChange"    # Z

    .prologue
    const/4 v3, 0x0

    const/4 v10, 0x1

    const/4 v5, 0x0

    .line 1458
    const-string v0, "SmsObserver"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v4, "SmsObserver onChange() thread name:"

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 1459
    iget-boolean v0, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;->isStop:Z

    if-nez v0, :cond_3

    .line 1461
    new-array v2, v10, [Ljava/lang/String;

    const-string v0, "body"

    aput-object v0, v2, v5

    .line 1462
    .local v2, "projection":[Ljava/lang/String;
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;->mContext:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "content://sms/inbox"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const-string v5, "date desc"

    move-object v4, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 1464
    .local v7, "cursor":Landroid/database/Cursor;
    if-eqz v7, :cond_0

    :try_start_0
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1466
    const-string v0, "body"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 1467
    .local v6, "body":Ljava/lang/String;
    invoke-virtual {p0, v6}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;->isBoyaaSms(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1469
    invoke-virtual {p0, v6}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;->getNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 1470
    .local v9, "ret":Ljava/lang/String;
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1472
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;->isStop:Z

    .line 1474
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v1, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver$1;

    invoke-direct {v1, p0, v9}, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver$1;-><init>(Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1486
    .end local v6    # "body":Ljava/lang/String;
    .end local v9    # "ret":Ljava/lang/String;
    :cond_0
    if-eqz v7, :cond_1

    .line 1492
    :try_start_1
    invoke-interface {v7}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 1505
    .end local v2    # "projection":[Ljava/lang/String;
    .end local v7    # "cursor":Landroid/database/Cursor;
    :cond_1
    :goto_0
    return-void

    .line 1485
    .restart local v2    # "projection":[Ljava/lang/String;
    .restart local v7    # "cursor":Landroid/database/Cursor;
    :catchall_0
    move-exception v0

    .line 1486
    if-eqz v7, :cond_2

    .line 1492
    :try_start_2
    invoke-interface {v7}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 1499
    :cond_2
    :goto_1
    throw v0

    .line 1494
    :catch_0
    move-exception v8

    .line 1496
    .local v8, "e":Ljava/lang/Exception;
    const-string v1, "LuaCallManager"

    invoke-virtual {v8}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 1494
    .end local v8    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v8

    .line 1496
    .restart local v8    # "e":Ljava/lang/Exception;
    const-string v0, "LuaCallManager"

    invoke-virtual {v8}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1503
    .end local v2    # "projection":[Ljava/lang/String;
    .end local v7    # "cursor":Landroid/database/Cursor;
    .end local v8    # "e":Ljava/lang/Exception;
    :cond_3
    iput-boolean v5, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;->isStop:Z

    goto :goto_0
.end method

.method public register()V
    .locals 3

    .prologue
    .line 1508
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;->mContext:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "content://sms"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 1509
    return-void
.end method

.method public unregister()V
    .locals 1

    .prologue
    .line 1512
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;->mContext:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 1513
    return-void
.end method
