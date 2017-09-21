.class public final Lcom/boyaa/godsdk/callback/CallbackStatus$SpecialMethodStatus;
.super Ljava/lang/Object;
.source "CallbackStatus.java"

# interfaces
.implements Lcom/boyaa/godsdk/callback/CallbackStatus$BaseCallbackStatus;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/godsdk/callback/CallbackStatus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "SpecialMethodStatus"
.end annotation


# static fields
.field public static final CALL_FAILED:I = 0x7594

.field public static final CALL_SUCCESS:I = 0x7530

.field public static final SPECIAL_METHOD_STATUS_START:I = 0x7530


# instance fields
.field final synthetic this$0:Lcom/boyaa/godsdk/callback/CallbackStatus;


# direct methods
.method public constructor <init>(Lcom/boyaa/godsdk/callback/CallbackStatus;)V
    .locals 0

    .prologue
    .line 136
    iput-object p1, p0, Lcom/boyaa/godsdk/callback/CallbackStatus$SpecialMethodStatus;->this$0:Lcom/boyaa/godsdk/callback/CallbackStatus;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
