.class Lcom/boyaa/videodemo/utils/AppRTCAudioManager$1;
.super Ljava/lang/Object;
.source "AppRTCAudioManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/videodemo/utils/AppRTCAudioManager;-><init>(Landroid/content/Context;Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/videodemo/utils/AppRTCAudioManager;


# direct methods
.method constructor <init>(Lcom/boyaa/videodemo/utils/AppRTCAudioManager;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$1;->this$0:Lcom/boyaa/videodemo/utils/AppRTCAudioManager;

    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$1;->this$0:Lcom/boyaa/videodemo/utils/AppRTCAudioManager;

    # invokes: Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->onProximitySensorChangedState()V
    invoke-static {v0}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->access$0(Lcom/boyaa/videodemo/utils/AppRTCAudioManager;)V

    .line 135
    return-void
.end method
