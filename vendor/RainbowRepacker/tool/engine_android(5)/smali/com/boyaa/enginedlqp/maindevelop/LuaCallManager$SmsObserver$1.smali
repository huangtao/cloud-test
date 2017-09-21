.class Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver$1;
.super Ljava/lang/Object;
.source "LuaCallManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;->onChange(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;

.field private final synthetic val$ret:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver$1;->this$1:Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver;

    iput-object p2, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver$1;->val$ret:Ljava/lang/String;

    .line 1474
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 1477
    const-string v0, "smsResult"

    const-string v1, "number"

    iget-object v2, p0, Lcom/boyaa/enginedlqp/maindevelop/LuaCallManager$SmsObserver$1;->val$ret:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 1478
    const-string v0, "onSmsResponse"

    invoke-static {v0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->call_lua(Ljava/lang/String;)I

    .line 1479
    return-void
.end method
