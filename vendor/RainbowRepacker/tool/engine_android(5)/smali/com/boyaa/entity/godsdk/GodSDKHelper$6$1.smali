.class Lcom/boyaa/entity/godsdk/GodSDKHelper$6$1;
.super Ljava/lang/Object;
.source "GodSDKHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/entity/godsdk/GodSDKHelper$6;->onCallSuccess(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/boyaa/entity/godsdk/GodSDKHelper$6;

.field private final synthetic val$ret:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/entity/godsdk/GodSDKHelper$6;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$6$1;->this$1:Lcom/boyaa/entity/godsdk/GodSDKHelper$6;

    iput-object p2, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$6$1;->val$ret:Ljava/lang/String;

    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 128
    const-string v0, "_AlixCheckAccountResult"

    const-string v1, "result"

    iget-object v2, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper$6$1;->val$ret:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    return-void
.end method
